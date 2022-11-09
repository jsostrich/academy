package sprindi;

public class ArticleServiceImpl3 implements ArticleService{
	private ArticleDAO articleDao;
	
	//DI - setter에 의한 종속 개체 주입
	public void setArticleDao(ArticleDAO articleDao) {
		this.articleDao = articleDao;
	}

	@Override
	public void write(ArticleVO vo) {
		System.out.println("ArticleServiceImpl3 - write()메서드 호출!!!");
	}
	
	
	
	
}
