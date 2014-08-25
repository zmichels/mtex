function ind = subsind(gB,subs)

% first select for minerals
isMineralName = cellfun(@ischar,subs);
if any(isMineralName)
  ind = gB.hasPhase(subs{isMineralName});
else
  ind = true(length(gB),1);
end
subs = subs(~isMineralName);

% other indexing
for i = 1:length(subs)
  
  if isa(subs{i},'logical')
    
    sub = any(subs{i}, find(size(subs{i}')==max(size(ind)),1));
    
    ind = ind & reshape(sub,size(ind));
    
  elseif isnumeric(subs{i})
    
    if any(subs{i} <= 0 | subs{i} > length(gB))
      error('Out of range; index must be a positive integer or logical.')
    end
    
    iind = false(size(ind));
    iind(subs{i}) = true;
    ind = ind & iind;
    
  elseif isa(subs{i},'polygon')
    
    ind = ind & inpolygon(gB,subs{i})';
    
  end
end
end