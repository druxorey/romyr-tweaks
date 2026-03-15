-- Cyber and Axolotl were here :3

local l = context.bl and 1 or -1
local matrices = context.matrices
local item = context.item

-- Disc Fragment 5
if (
	I:isOf(item, Items:get("minecraft:disc_fragment_5"))
) then
	M:moveY(matrices, 0.05)
	M:moveX(matrices, 0 * l)
	M:moveZ(matrices, 0.1)
	
	M:rotateX(matrices, 10)
	M:rotateY(matrices, 15 * l)
	M:rotateZ(matrices, 100 * l)

	M:scale(matrices, 1.1, 1.1, 1.1)
end
