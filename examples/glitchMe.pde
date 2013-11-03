
void setup(){
	//size(500, 500);//1073, 616);
	//background(0);
	//console.log(parent);
	pjs_ready(externals.canvas);
	
	// dont waste energy
	noLoop();
}

void draw(){
	loadPixels();
	// loop trough some random pixel strokes to create a "bug"
	int num_bugs = round(random(1,5));
	int i = 0;
	while( i<num_bugs ){
	    boolean horiz =  boolean( round( random(0,1) ) );
	    int stroke_w = round(random(8,50));

	    int start_point = round(random(0, (horiz?width-stroke_w:height-stroke_w) ));
	    int x = horiz ? 0 : start_point;
	    int y = horiz ? start_point : 0;
	    int matrix = round(random(-.49,4.49));

	    while( (horiz && y < start_point+stroke_w) || (!horiz && x<start_point+stroke_w) ){
	    	while( (horiz && x < width) || (!horiz && y < height) ){
	    		int offset = x+y*width;

	    		// different matrixes can apply ≠ transformations
	    		// anybody can add his own ones; just play with maths and see what you get
	    		switch (matrix){
	    			case 0:
	    				pixels[offset]=pixels[constrain(offset-5, 0 ,pixels.length-1)];
	    				break;
	    			case 1:
	    				pixels[offset]=pixels[constrain(round(offset/2), 0 ,pixels.length-1)];
	    				break;
	    			case 2:
	    				pixels[offset]=pixels[constrain(offset+x-y, 0 ,pixels.length-1)];
	    				break;
	    			case 3:
	    				pixels[offset]=pixels[constrain(offset+round(sin(x)*10), 0 ,pixels.length-1)];
	    				break;
	    			case 4:
	    				pixels[offset]=pixels[constrain(offset+round(cos(y)*10), 0 ,pixels.length-1)];
	    				break;
	    			default:
	    				//pixels[offset]=color(0);
	    				break;
	    		}
	    		//println(x + " - " + y + " - " + offset);

	    		if(horiz) x++;
	    		else y++;
	    	}

	    	if(horiz){
	    		y++;
	    		x=0;
	    	}
	    	else{
	    		x++;
	    		y=0;
	    	}
	    }

	    i++;
	}
	//println("updated");
	updatePixels();
}