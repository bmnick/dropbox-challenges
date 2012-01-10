x={};gets.chomp.to_i.times{a,c=gets.chomp.split;x[c.to_i]=a};m=f=false;n=2
until m||f
c=x.keys.combination(n).to_a;f=true if c.size==0;c.each{|b|sum=b.reduce(0){|t,v|t+v};m=b if sum==0};n+=1
end
if m then s=m.map{|c|x[c]}.sort.each{|a|p a} else p 'no solution' end
