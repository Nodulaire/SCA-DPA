function [inputs]=myin(fname,ilen,n)
myfile=fopen(fname,'r');
inputs=zeros(n,ilen);
for i=1:n
	s = fgets(myfile, 1024);
	[ii, l]=sscanf(s, '%02x ', ilen);
	inputs(i,:)=ii;
end
fclose(myfile);
