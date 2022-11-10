package sprindi;

public class ArticleServiceImpl1 implements ArticleService{
	private ArticleDAO dao;
	
	public ArticleServiceImpl1() {
		dao = new OracleArticleDAO(); 
	}
	
	@Override
	public void write(ArticleVO vo) {
		System.out.println("ArticleService의 write()메서드 호출!");
		dao.insert(vo);
	}
	
}
