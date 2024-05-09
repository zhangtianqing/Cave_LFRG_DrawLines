from PIL import Image

# 打开四个图像文件
left_image = Image.open('./drawLines/left.png')
front_image = Image.open('./drawLines/front.png')
right_image = Image.open('./drawLines/right.png')
ground_image = Image.open('./drawLines/ground.png')

# 获取图像的宽度和高度
width = left_image.width + front_image.width + right_image.width + ground_image.width
height = max(left_image.height, front_image.height, right_image.height, ground_image.height)

# 创建新的拼接图像
result_image = Image.new('RGB', (width, height))

# 将四个图像水平拼接到新图像中
result_image.paste(left_image, (0, 0))
result_image.paste(front_image, (left_image.width, 0))
result_image.paste(right_image, (left_image.width + front_image.width, 0))
result_image.paste(ground_image, (left_image.width + front_image.width + right_image.width, 0))

# 保存拼接后的图像
result_image.save('result.png')
