run_all_in_parallel:
	make -j test_Windows8.1_firefox_40 test_Windows7_chrome_45 test_OSX10.10_safari_8
	
test_Windows8.1_firefox_40:
	browserName=firefox version=40.0 platform="Windows 8.1" perl test_script.pl

test_Windows7_chrome_45:
	browserName=chrome version=45.0 platform="Windows 7" perl test_script.pl

test_OSX10.10_safari_8:
	browserName=safari version=8.0 platform="OS X 10.10" perl test_script.pl