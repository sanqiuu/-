@echo off
echo 
echo ************************************************************
echo                      �͹� ��������
echo                   һ������YouTube�͹���Ƶ
echo              	  by���� QQ1209803531  
echo *************************************************************
set /p proxy=����������ַ��
set HTTP_PROXY=%proxy%
set HTTPS_PROXY=%proxy%  
                                                        
set /p url=��������Ƶ��ַ��

if "%url%" == "" echo ��ʾ����������Ƶ������ַ && goto end
echo ���ڲ�ѯ֧�����صĸ�ʽ�б�.......
.\youtubedr\youtubedr.exe info %url%
echo ע�⣺audio only���д�����Ƶ��video only���д�����Ƶ
set /p ITAG_V=������ͼ���ļ�ITAG(MIMETYPE=video/mp4,VIDEO_QUALITYԽ��Խ��)��
set /p ITAG_A=��������Ƶ�ļ�ITAG(MIMETYPE=audio/mp4,AUDIO_ QUALITY=medium����õ�)��
echo �������أ����Ժ�...
.\youtubedr\youtubedr download -d ./output -o 1.m4v -q %ITAG_V% %url%
.\youtubedr\youtubedr download -d ./output -o 1.m4a -q %ITAG_A% %url%
echo ���ںϳɣ����Ժ�...
.\ffmpeg\ffmpeg -i .\output\1.m4v -i .\output\1.m4a -vcodec copy -acodec copy .\output\video.mp4

echo ������ϣ���������˳�!
pause > nul

