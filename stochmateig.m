% http://www.mathworks.com/matlabcentral/fileexchange/9700-random-vectors-with-fixed-sum
%function [] = stochmateig(N,dim,colsum,elmin,elmax)

%% Initialize parameters (uncomment to run as script)

N=10000;
dim=3;
colsum = 1;
elmin=0;
elmax=1;

%%
ss=zeros(dim,dim,N);
eV=zeros(dim,N);

for i=1:N
    ss(:,:,i)=randfixedsum(dim,dim,colsum,elmin,elmax);
    [V D]=eig(ss(:,:,i));
    [~,J]=find(D>0.99 & D<1.00001);
    if length(J)~=1
        error('no or more than one eigenvalue equal to 1');
    end
    eV(:,i) = V(:,J);
end

% Settings
%-------------------------------
set(0,'defaultaxesfontsize',20);
set(0,'defaulttextfontsize',20);
scrsz = get(0,'ScreenSize');
%-------------------------------

% Plot data
%-------------------------------
h1=figure('Position',[0 0 scrsz(3)/4.5 scrsz(4)/1.4]); set(h1,'Color','w');
scatter3(eV(1,:)',eV(2,:)',eV(3,:)',5,'r');
h2=figure('Position',[0 scrsz(4)/1.4 scrsz(3)/4.5 scrsz(4)/1.4]); set(h2,'Color','w');
plot(1:length(sum(eV,1)), sum(eV,1),'k.')
fprintf('\nnumber of Perron vector sums greater than 0: %0.0f\n',length(find(sum(eV,1)>0)));
fprintf('number of Perron vector sums less than 0: %0.0f\n\n',length(find(sum(eV,1)<0)));