listing=dir('/home/aka/Ubuntu/Project/SMAI/actual/Font/*');
sz=size(listing);
sz=sz(1);
for i=3:sz
    varit='/home/aka/Ubuntu/Project/SMAI/actual/Font/';
    varit=strcat(varit,listing(i).('name'));
    img=dir(varit);
    szit=size(img);
    szit=szit(1);
    mat=zeros(szit,7);
    for j=3:szit
        imgname=strcat(varit,'/');
        imgname=strcat(imgname,img(j).('name'));
        valit=feature_vec(imgname);
        doit=size(valit);
        doit=doit(1);
        p=valit';
        mat(j,:)=p;
    end
end