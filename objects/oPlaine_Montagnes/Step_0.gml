camX = camera_get_view_x(view_camera[0])
x += (camX - oldCamX) / 1.6
oldCamX = camX
camY = camera_get_view_y(view_camera[0])
y += (camY - oldCamY) / 2
oldCamY = camY