public virtual class Rectangle extends Shape {
	//fields 
    private integer height;
    private integer width; 
    //constructor 
    public Rectangle(){
        setNumberOfSides(4); 
    }
    public Rectangle(integer height, integer width){
        this.height = height; 
        this.width = width; 
        setNumberOfSides(4); 
    }
    
    //Mutators 
    public virtual void setHeight(integer height){
        this.height = height; 
    }
    public integer getHeight(){
        return this.height;
    }
    
    public virtual void setWidth(integer width){
        this.width = width; 
    }
    
    public integer getWidth(){
        return this.width; 
    }
    
    //interface methods 
    public integer calculateArea(){
        return width*height; 
    } 
    public integer calculatePerimiter(){
        return 2*(width + height); 
    } 
    public void draw(){
        System.debug('Drawing a rectangle with width: ' + width + 'and height: ' + height);
        
    }
}