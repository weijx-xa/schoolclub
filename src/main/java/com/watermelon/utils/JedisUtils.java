package com.watermelon.utils;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import com.mysql.fabric.xmlrpc.base.Array;

import redis.clients.jedis.Jedis;
import redis.clients.jedis.JedisPool;
import redis.clients.jedis.JedisPoolConfig;
import redis.clients.jedis.Transaction;

public class JedisUtils {

    private static final Logger logger = LogManager.getLogger(JedisUtils.class);

    private static JedisPool jedisPool = new JedisPool("115.28.157.231");

    
    
    private JedisUtils() {
    }

    //务必使用过之后要jedis.close()关闭连接
    public static Jedis getJedis() {
        Jedis jedis= jedisPool.getResource();
        jedis.auth("laimin123");
        return jedis;
    }

    //向key指向的set集合中插入若干条数据
    public static void sadd(String key, String... members) {
        //redis操作发生异常时要把异常捕获，不要响应正常的业务逻辑
        Jedis jedis = null;
        try {
            jedis = getJedis();
            jedis.sadd(key, members);
            logger.debug("sadd：向缓存中添加数据，key：{} value：{}", key, members);
        } catch (Exception e) {
            logger.error("sadd：向缓存中添加数据时出现异常，key：{} value：{}", key, members);
        } finally {
            //保证jedis被关闭（归还给连接池）
            closeQuietly(jedis);
        }

    }

    //从key指向的set集合中取出所有数据并删除此key指向的set集合
    @SuppressWarnings("unchecked")
    public static Set<String> smembersAndDel(String key) {
        Jedis jedis = null;
        Set<String> set = null;
        try {
            jedis = getJedis();
            Transaction tx = jedis.multi();
            tx.smembers(key);
            tx.del(key);

            List<Object> result = tx.exec();
            if (result == null || result.isEmpty()) {
                logger.error("smembersAndDel：从缓存中取出数据以及删除数据的事务失败");
            } else {
                set = (Set<String>) result.get(0);
                logger.debug("smembersAndDel：从缓存中取出数据同时删除了key，key：{}，value：{}", key, set);
            }

        } catch (Exception e) {
            logger.error("smembersAndDel：从缓存中取出数据或者删除数据是出现异常", e);
        } finally {
            closeQuietly(jedis);
        }
        return set;
    }
    
    //从key指向的set集合中取出所有数据并删除此key指向的set集合
    @SuppressWarnings("unchecked")
    public static Set<String> smembers(String key) {
        Jedis jedis = null;
        Set<String> set = null;
        try {
            jedis = getJedis();
            Transaction tx = jedis.multi();
            tx.smembers(key);
            List<Object> result = tx.exec();
            if (result == null || result.isEmpty()) {
                logger.error("smembersAndDel：从缓存中取出数据数据的事务失败");
            } else {
                set = (Set<String>) result.get(0);
                logger.debug("smembersAndDel：从缓存中取出数据删除了key，key：{}，value：{}", key, set);
            }

        } catch (Exception e) {
            logger.error("smembersAndDel：从缓存中取出数据数据是出现异常", e);
        } finally {
            closeQuietly(jedis);
        }
        return set;
    }

    public static void setex(String key, int expire, String value) {
        Jedis jedis = null;
        try {
            jedis = getJedis();
            jedis.setex(key, expire, value);
            logger.debug("setex：向缓存中添加数据，key：{}，value：{}，过期时间：{}秒", key, value, expire);
        } catch (Exception e) {
            logger.error("setex：向缓存中添加数据时出现异常，key：{}，value：{}，过期时间：{}秒", key, value, expire, e);
        } finally {
            //保证jedis被关闭（归还给连接池）
            closeQuietly(jedis);
        }
    }

    public static String get(String key) {
        Jedis jedis = null;
        String value = null;
        try {
            jedis = getJedis();
            value = jedis.get(key);
            logger.debug("get：从缓存中获取数据，key：{}，value：{}", key, value);
        } catch (Exception e) {
            logger.error("get：从缓存中获取数据时出现异常，key：{}，value：{}", key, value, e);
        } finally {
            //保证jedis被关闭（归还给连接池）
            closeQuietly(jedis);
        }
        return value;
    }

    //根据key的前缀删除所有相关的key
    public static void del(String keyPattern) {
        Jedis jedis = null;
        try {
            jedis = getJedis();
            Set<String> keys = jedis.keys(keyPattern);

            if (keys != null && keys.size() > 0) {
                String[] arr = new String[keys.size()];
                jedis.del(keys.toArray(arr));
            }
            logger.debug("del：从缓存中删除数据，keyPattern：{}", keyPattern);
        } catch (Exception e) {
            logger.error("del：从缓存中删除数据时出现异常，keyPattern：{}", keyPattern);
        } finally {
            //保证jedis被关闭（归还给连接池）
            closeQuietly(jedis);
        }
    }

    public static void closeQuietly(Jedis jedis) {
        if (jedis != null) {
            try {
                jedis.close();
            } catch (Exception e) {
                logger.error("关闭jedis连接时发生异常", e);
            }
        }
    }
}
