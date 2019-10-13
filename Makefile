BASEDIR=$(CURDIR)
OUTPUTDIR=$(BASEDIR)/webroot

S3_BUCKET=ethan.codebarber.com


help:
	@echo 'Makefile for Web site @ $(S3_BUCKET)                                                    '
	@echo '                                                                          '
	@echo 'Usage:                                                                    '
	@echo '   make publish                        Upload $(OUTPUTDIR)                '
	@echo '   make s3_upload                      upload the web site via S3         '
	@echo '   make upload                         upload the web site via S3         '
	@echo '                                                                          '

upload: s3_upload

publish: s3_upload

s3_upload: 
	aws s3 sync $(OUTPUTDIR)/ s3://$(S3_BUCKET) --acl public-read --delete


.PHONY: help publish s3_upload upload
