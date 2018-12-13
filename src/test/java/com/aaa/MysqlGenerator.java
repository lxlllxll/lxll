package com.aaa;


import com.baomidou.mybatisplus.generator.AutoGenerator;
import com.baomidou.mybatisplus.generator.config.DataSourceConfig;
import com.baomidou.mybatisplus.generator.config.GlobalConfig;
import com.baomidou.mybatisplus.generator.config.PackageConfig;
import com.baomidou.mybatisplus.generator.config.StrategyConfig;
import com.baomidou.mybatisplus.generator.config.rules.DbType;
import com.baomidou.mybatisplus.generator.config.rules.NamingStrategy;


/**
 * <p>
 * 代码生成器演示
 * </p>
 *
 * @author hubin
 * @date 2016-12-01
 */
public class MysqlGenerator {

    /**
     * <p>
     * MySQL 生成演示
     * </p>
     */
    public static void main(String[] args) {
        AutoGenerator mpg = new AutoGenerator();
// 全局配置
        GlobalConfig gc = new GlobalConfig();
        //gc.setOutputDir("D:\\work\\AAA带班\\QY87\\workspace\\qy87springbootjsp\\src\\main\\java");
        //E:\ideaworks\demo1\src\main\java
        gc.setOutputDir("E:\\ideaworks\\yfbank\\src\\main\\java");
        gc.setFileOverride(true);
        gc.setActiveRecord(false);
// 不需要ActiveRecord特性的请改为false
        gc.setEnableCache(false);// XML 二级缓存
        gc.setBaseResultMap(true);// XML ResultMap
        gc.setBaseColumnList(false);// XML columList
        gc.setAuthor("lxl");// 作者
// 自定义文件命名，注意 %s 会自动填充表实体属性！
        gc.setControllerName("%sController");
        gc.setServiceName("%sService");
        gc.setServiceImplName("%sServiceImpl");
        gc.setMapperName("%sMapper");
        gc.setXmlName("%sMapper");
        mpg.setGlobalConfig(gc);
// 数据源配置
        DataSourceConfig dsc = new DataSourceConfig();
        dsc.setDbType(DbType.MYSQL);
        dsc.setDriverName("com.mysql.jdbc.Driver");
        dsc.setUsername("root");
        dsc.setPassword("qwe");
        dsc.setUrl("jdbc:mysql://127.0.0.1:3306/yfbank");
        mpg.setDataSource(dsc);
// 策略配置
        StrategyConfig strategy = new StrategyConfig();
        //strategy.setTablePrefix(new String[]{"sys_"});// 此处可以修改为您的表前缀
        strategy.setNaming(NamingStrategy.underline_to_camel);// 表名生成策略
        strategy.setInclude(new String[]{"traderecord"}); // 需要生成的表
        strategy.setSuperServiceClass(null);
        strategy.setSuperServiceImplClass(null);
        strategy.setSuperMapperClass(null);
        mpg.setStrategy(strategy);
// 包配置
        PackageConfig pc = new PackageConfig();
        pc.setParent("com.aaa");
        pc.setController("controller");
        pc.setService("service");
        pc.setServiceImpl("service.impl");
        pc.setMapper("dao");
        pc.setEntity("entity");
        //pc.setXml("xml");
        pc.setXml("dao");
        mpg.setPackageInfo(pc);
// 执行生成
        mpg.execute();
    }

}