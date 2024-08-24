return function()
	local Dash = require(script.Parent)
	local shallowEqual = Dash.shallowEqual

	describe("shallowEqual", function()
		it("should run correctly for primitive inputs", function()
			assertSnapshot(shallowEqual("toast", "toast"), [[true]])
			assertSnapshot(shallowEqual("toast", "bread"), [[false]])
			assertSnapshot(shallowEqual(5, 5), [[true]])
			assertSnapshot(shallowEqual(5, 50), [[false]])
			assertSnapshot(shallowEqual("toast", 5), [[false]])
			assertSnapshot(shallowEqual(5, "5"), [[false]])
			assertSnapshot(shallowEqual(5, nil), [[false]])
			assertSnapshot(shallowEqual(nil, nil), [[true]])
		end)
		it("should run correctly for one table input", function()
			assertSnapshot(shallowEqual({}, "toast"), [[false]])
			assertSnapshot(shallowEqual("toast", {}), [[false]])
			assertSnapshot(shallowEqual({}, nil), [[false]])
			assertSnapshot(shallowEqual(nil, {}), [[false]])
		end)
		it("should run correctly for arrays", function()
			assertSnapshot(shallowEqual({}, {}), [[true]])
			assertSnapshot(shallowEqual({}, {1, 2, 3}), [[false]])
			assertSnapshot(shallowEqual({1, 2, 3}, {1, 2, 3}), [[true]])
		end)
		it("should run correctly for maps", function()
			assertSnapshot(shallowEqual({x = 3}, {x = 3}), [[true]])
			assertSnapshot(shallowEqual({x = 3}, {x = 3, y = 4}), [[false]])
			assertSnapshot(shallowEqual({x = 3, y = 4}, {x = 3, y = 4000}), [[false]])
			assertSnapshot(shallowEqual({x = 3, y = 4000}, {x = 3}), [[false]])
			local child = {d = 9}
			assertSnapshot(shallowEqual({x = 3, y = child}, {x = 3, y = child}), [[true]])
			assertSnapshot(shallowEqual({x = 3, y = child}, {x = 3, y = {d = 9}}), [[false]])
		end)
	end)
end