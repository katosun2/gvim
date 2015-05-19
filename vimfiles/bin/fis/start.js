var cp = require('child_process');

//exec
cp.exec('fis -v'/*command*/,{}/*options, [optiona]l*/, function(err, stdout, stderr){
	if(stdout){
		console.log('stdout: ' + stdout);
	}else{
		console.log('stderr: ' + stderr);
	}
})
