function [traces] = myload(fname,trlen,start,len,n)

myfile=fopen(fname,'r');
traces=zeros(n,len);
for i=1:n
	fseek(myfile, start, 'cof');
    if (len+start > trlen)
        t=fread(myfile, len-start, 'uint8');
    else 
        t=fread(myfile, len, 'uint8');
    end;
	fseek(myfile, (trlen-len-start), 'cof');
	traces(i,:)=t;
end
fclose(myfile);
