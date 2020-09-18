###
 # @Author: shangyameng
 # @Email: shangyameng@aliyun.com
 # @Date: 2020-05-13 16:51:33
 # @LastEditTime: 2020-05-13 16:55:02
 # @FilePath: /python3engine/build_image.sh
 ###

printf "\n================ Start build engine-py3:latest image ================\n\n"
docker build -t base_image/py3_dev:latest .
printf "\n================ engine-py3:latest image build Successful ================\n\n"
