package de.osramos.reprovis.test.selenium;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertTrue;

import java.util.HashMap;
import java.util.List;
import java.util.concurrent.TimeUnit;

import org.junit.After;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.firefox.FirefoxDriver;

import de.osramos.reprovis.test.testhelper.Setup;

public class ComponentSeleniumTest {
	
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
		NavigateTo.component(driver);
		assertTrue(driver.findElement(By.id("myModalLabel")).getText().contains("Trouble Electrical Component"));
	}
	
	@Test
	public void navigateBackTest() throws Exception{
		NavigateTo.component(driver);
		driver.findElement(By.id("componentModal")).findElements(By.tagName("button")).get(1).click();
		NavigateTo.waitForAjaxLoad();
		assertTrue(driver.findElement(By.id("dynamicHeading")).getText().contains("Testing Device:"));
	}
	
	@Test
	public void dataTest() throws Exception{
		NavigateTo.component(driver);
		HashMap<String, String> attributeStore = new HashMap<String, String>();
		List<WebElement> attributes = driver.findElement(By.id("componentDetails")).findElements(By.tagName("td"));
		for(int i = 0; i < attributes.size(); i += 2){
			attributeStore.put(attributes.get(i).getText(), attributes.get(i+1).getText());
		}
		assertEquals("Tests", attributeStore.get("Name"));
		assertEquals("Ok", attributeStore.get("Value"));
		assertEquals("Tue Jun 18 00:44:47 CEST 2013", attributeStore.get("Last Status Change"));
	}
}
