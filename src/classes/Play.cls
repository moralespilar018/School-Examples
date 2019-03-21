public virtual class Play {
	private string title; 
    private string author; 
    private string genre; 
    
    public Play(){
		 //constructor?
		this.title = ' '; 
        this.author = ' '; 
        this.genre = ' '; 
        
    }
    
    public Play(string aTitle){
        //overloaded comnstructor?
        this.title = aTitle; 
        this.author = ''; 
        this.genre = ''; 
    }
    
    void setTitle(string aTitle){
    	  title = aTitle; 
    }
    
    //made  public and virtual to access by inherited classes 
    public virtual void setAuthor(string anAuthor){
        author = anAuthor; 
    }
    
    public virtual void setGenre(string aGenre){
        genre = aGenre; 
    }
    
    string getTitle(){
        return title; 
    }
	
    public virtual string getAuthor(){
        return author; 
    }
    
    public virtual string getGenre(){
        return genre; 
    }
    
    public virtual void display(){
		system.debug('Title: ' + title + '\n' + 'Author: ' + author + '\n' + 'Genre: ' + genre);
    }


}