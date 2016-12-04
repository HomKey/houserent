package com.hk.test.support;

import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.AbstractTransactionalJUnit4SpringContextTests;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class) //① 指定测试用例运行器
@ContextConfiguration(locations={"/spring/applicationContext.xml"
								//,"classpath:applicationContext-system.xml"
								//,"classpath:applicationContext-order.xml"
					 })
//@TransactionConfiguration(transactionManager="transactionManager", defaultRollback=true)
//@Transactional //② 使测试用例的所有方法都将工作于事务环境下
public class BaseTest extends AbstractTransactionalJUnit4SpringContextTests
{

}
