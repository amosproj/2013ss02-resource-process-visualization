package de.osramos.reprovis.test.selenium;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertTrue;

import java.util.concurrent.TimeUnit;

import org.junit.After;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.firefox.FirefoxDriver;

import de.osramos.reprovis.test.testhelper.Setup;

public class FactorySeleniumTest {
	
	private WebDriver driver;

	@BeforeClass
	public static void setUpOnce() throws Exception{
		Setup.setUpDBForSelenium();
	}
	
	@Before
	public void setUp(){
		driver = new FirefoxDriver();
		driver.manage().timeouts().implicitlyWait(10, TimeUnit.SECONDS);
	}
	
	@After
	public void tearDown(){
		driver.quit();
	}
	
	@Test
	public void navigateToTest() throws Exception{
		NavigateTo.factory(driver);
		assertTrue(driver.findElement(By.id("dynamicHeading")).getText().contains("Factory:"));
	}
	
	@Test
	public void navigateBackTest() throws Exception{
		NavigateTo.factory(driver);
		driver.findElement(By.id("breadCrumbNavi")).findElements(By.tagName("a")).get(0).click();
		NavigateTo.waitForAjaxLoad();
		assertEquals(1, driver.findElement(By.id("breadCrumbNavi")).findElements(By.tagName("a")).size());
	}
	
	@Test
	public void dataTest() throws Exception{
		NavigateTo.factory(driver);
		assertEquals("Germany", driver.findElement(By.id("factoryCountry")).getText());
		assertEquals("Ingolstadt", driver.findElement(By.id("factoryName")).getText());
		assertEquals("Audi", driver.findElement(By.id("factoryBrand")).getText());
		assertEquals("1", driver.findElement(By.id("factoryUPSSystems")).getText());
		assertEquals("DSA GmbH", driver.findElement(By.id("factoryUPSProvider")).getText());
		assertEquals("3", driver.findElement(By.id("factoryUPSServers")).getText());
		assertEquals("1", driver.findElement(By.id("factoryUPSClients")).getText());
		assertEquals("35386 (1.12.2012)", driver.findElement(By.id("factoryStaff")).getText());
		assertEquals("551889", driver.findElement(By.id("factoryVehiclesPerYear")).getText());
		assertEquals("2580", driver.findElement(By.id("factoryVehiclesPerDay")).getText());
		assertEquals("Audi A3, Audi A3 Sportback", driver.findElement(By.id("factoryCars")).getText());
	}
}
