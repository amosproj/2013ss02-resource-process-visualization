// Leaflet workd map testings

describe("Leaflet world map", function() {
	it("should initialize the map object", function() {
		expect(typeof map).toBe("object");
	});
	
	it("should have an API key", function() {
		expect(pluginConf.apikey).not.toBeFalsy();
	});
	
	it("should have a style", function() {
		expect(pluginConf.style).not.toBeFalsy();
	});
	
	it("should have center", function() {
		expect(pluginConf.center).not.toBeFalsy();
	});
	
	it("should have maxzoom", function() {
		expect(pluginConf.maxZoom).not.toBeFalsy();
	});
	
	it("should have startHeight", function() {
		expect(pluginConf.startHeight).not.toBeFalsy();
	});
});

// Testings for global hierarchy handler
describe("Global Hierarchy Handler", function() {
	it("should create the object", function() {
		expect(GlobalHierarchyHandler).not.toBeFalsy();
	});
	
	it("should zoom into global level", function() {
		runs(function() {
			GlobalHierarchyHandler.hierarchyZoom("global", 0);
		})
	})
});