


function rtn=randGraphGenerator(N,type)
    usedNode=NaN(1,10);
    availableNode=1:N;
    
    if strcmp(type,'Pairing')
        % number of edges
        if mod(N,2)==0
            Nedge=N/2;
        else
            Nedge=ceil(N/2);
        end
        % initial edgelist
        edgelist=zeros(Nedge,2);
        % randomize node
        l=randsample(availableNode,length(availableNode));
        % get edge
        for i=1:floor(N/2)
                j=(i-1)*2;
                edgelist(i,:)=[l(j+1),l(j+2)];
        end
        if N>j+2
                edgelist(i+1,:)=[l(j+2),l(j+3)];
        end
    end
    
    if strcmp(type,'Tree')
        edgelist=zeros(N-1,2);
        for i=1:N
            if i~=N
                sampleInd=randsample(availableNode(~isnan(availableNode)),1);
            else
                sampleInd=availableNode(~isnan(availableNode));
            end
            if ~isempty(usedNode(~isnan(usedNode)))
                if length(usedNode)==1
                    edgelist(i-1,:)=[usedNode, sampleInd];
                else
                    edgelist(i-1,:)=[randsample(usedNode(~isnan(usedNode)),1), sampleInd];
                end
            end
            usedNode(i)=sampleInd;
            availableNode(sampleInd)=NaN;
        end
    end
    
    rtn=edgelist;
end
