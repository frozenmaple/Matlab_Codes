%-----------------------------------------------------------------
%   exa120504.m;    例12.5.4, 说明一维小波包的剪切、分割和组合     
%-----------------------------------------------------------------
clear;

load noisdopp;
x=noisdopp;

% 用db1小波包分解信号x到第3层
% 采用shannon熵的标准
wpTree=wpdec(x,3,'db1','shannon');
plot(wpTree);

%小波包的剪切,j=2
wTreeCut=wpcutree(wpTree,2);
plot(wTreeCut);

%重新分解小波包节点(3,0)
wTreeSplit=wpsplt(wpTree,[3,0]);
plot(wTreeSplit);

%重新组合小波包
wTreeJoin=wpjoin(wpTree,[2,3]);
plot(wTreeJoin);%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%       一维小波包的分解和重建             %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
