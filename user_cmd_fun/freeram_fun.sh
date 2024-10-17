function freeram(){
	free -h && sudo sysctl vm.drop_caches=3 && free -h
}
