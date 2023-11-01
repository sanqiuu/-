@echo off
echo 
echo ************************************************************
echo                      油管 下载助手
echo                   一键下载YouTube油管视频
echo              	  by三秋 QQ1209803531  
echo *************************************************************
set /p proxy=请输入代理地址：
set HTTP_PROXY=%proxy%
set HTTPS_PROXY=%proxy%  
                                                        
set /p url=请输入视频地址：

if "%url%" == "" echo 提示：请输入视频完整地址 && goto end
echo 正在查询支持下载的格式列表.......
.\youtubedr\youtubedr.exe info %url%
echo 注意：audio only的行代表音频，video only的行代表视频
set /p ITAG_V=请输入图像文件ITAG(MIMETYPE=video/mp4,VIDEO_QUALITY越大越好)：
set /p ITAG_A=请输入音频文件ITAG(MIMETYPE=audio/mp4,AUDIO_ QUALITY=medium是最好的)：
echo 正在下载，请稍后...
.\youtubedr\youtubedr download -d ./output -o 1.m4v -q %ITAG_V% %url%
.\youtubedr\youtubedr download -d ./output -o 1.m4a -q %ITAG_A% %url%
echo 正在合成，请稍后...
.\ffmpeg\ffmpeg -i .\output\1.m4v -i .\output\1.m4a -vcodec copy -acodec copy .\output\video.mp4

echo 下载完毕，按任意键退出!
pause > nul

