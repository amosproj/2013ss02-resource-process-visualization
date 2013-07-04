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

public class DeviceSeleniumTest {
	
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
		NavigateTo.device(driver);
		assertTrue(driver.findElement(By.id("dynamicHeading")).getText().contains("Testing Device:"));
	}
	
	@Test
	public void navigateBackTest() throws Exception{
		NavigateTo.device(driver);
		driver.findElement(By.id("breadCrumbNavi")).findElements(By.tagName("a")).get(4).click();
		NavigateTo.waitForAjaxLoad();
		assertTrue(driver.findElement(By.id("dynamicHeading")).getText().contains("Location:"));
	}
	
	@Test
	public void dataTest() throws Exception{
		NavigateTo.device(driver);
		assertEquals("MFTD2XI1-052", driver.findElement(By.id("testingDeviceName")).getText());
		assertEquals("DSA Multifunction-tester Gen. 2", driver.findElement(By.id("testingDeviceDescription")).getText());
		assertEquals("D1", driver.findElement(By.id("testingDeviceCategory")).getText());
		assertEquals("28994613", driver.findElement(By.id("testingDeviceSerialnumber")).getText());
	}
}
