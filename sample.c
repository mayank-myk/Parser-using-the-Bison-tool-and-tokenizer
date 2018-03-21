Job_1 = Job(job_id=1, flops_required = 100, deadline = 200, mem_required = 1024,affinity
= [0.2,0.5,1,2]);
Ram = Memory(memory_type= primary, mem_size = 2048);
Linka = Link(start_point = 'abhi', end_point = 'mayank',bandwidth =40, 55);
Processor1 = Processor(isa = ARM, clock_speed : 56, l1_memory = Mem1);
Cluster1 = Cluster(processors = processor_array, topology = star, 40, 50, name = 'cluster1');

for(i=0; i<5; i++){
	a = b+c;
}

run(Proc1);
wait(1);

if a<b {
	a = b+c;
}

if a<b {
	a = b+c;
}
else{
	a = c+d;
}

while( a < 5) {
	x = y+z;
}

for(i=0; i<5; i++){
	a = a+1;
}