-- AuroraGen - Aseprite script for aurora effect generation
-- Created by EmptyCell
-- 4/3/2021

function makeWaves(it)
	if it() == dlg.sepColor then
		local offset = 1
		for i = 1, math.random(6,12), 1 do
			if img:getPixel(it.x,it.y - offset) == dlg.sepColor then
				return
			end
			img:drawPixel(it.x, it.y - offset, dlg.firstColorIndex)
			offset = offset + 1
		end
		for i = 1, math.random(7,13), 1 do
			if img:getPixel(it.x,it.y - offset) == dlg.sepColor then
				return
			end
			img:drawPixel(it.x, it.y - offset, dlg.secondColorIndex)
			offset = offset + 1
		end
		for i = 1, math.random(8,15), 1 do
			if img:getPixel(it.x,it.y - offset) == dlg.sepColor then
				return
			end
			img:drawPixel(it.x, it.y - offset, dlg.thirdColorIndex)
			offset = offset + 1
		end
		for i = 1, math.random(9,18), 1 do
			if img:getPixel(it.x,it.y - offset) == dlg.sepColor then
				return
			end
			img:drawPixel(it.x, it.y - offset, dlg.lastColorIndex)
			offset = offset + 1
		end
	end
end

function makeAurora()
	math.randomseed(os.time())
	
	for it in img:pixels() do
		makeWaves(it)
	end

	for it in img:pixels() do
		if it() == dlg.sepColor then
			it(dlg.mainColorIndex)
		end
	end
	
	cel.image = img
	app.refresh()
end

cel = app.activeCel
if not cel then
  return app.alert("There is no active image")
end

app.command.ChangePixelFormat{format="indexed", dithering="none"}
dlg = Dialog{title="AuroraGen by EmptyCell"}:slider{id="sepColor", label="Temporary Main Line Color Index:", min=0, max=255, value="0"}
											:slider{id="mainColorIndex", label="Main Line Color Index:", min=0, max=255, value="0"}
											:slider{id="firstColorIndex", label="First Wave Color Index:", min=0, max=255, value="0"}
											:slider{id="secondColorIndex", label="Second Wave Color Index:", min=0, max=255, value="0"}
											:slider{id="thirdColorIndex", label="Third Wave Color Index:", min=0, max=255, value="0"}
											:slider{id="lastColorIndex", label="Last Wave Color Index:", min=0, max=255, value="0"}
											:check{id="saveNew", label="Save as new file?", selected=false}
											:button{id="ok", text="OK"}
											:button{text="Cancel"}
											:show().data
if dlg.ok then
	img = cel.image:clone()
	makeAurora()
end

if dlg.saveNew then
	app.command.SaveFileAs{filename = "C:\\Users\\" .. os.getenv("USERNAME") .. "\\Desktop\\AurGen-" .. os.date('%Y%m%d%H%M%S') .. ".png"}
end