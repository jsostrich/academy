package sprindi;

public class AricleServiceImpl1 implements ArticleService{
	private ArticleDAO dao;
	
	public AricleServiceImpl1() {
		dao = new MySqlArticleDAO(); 
	}
	
	@Override
	public void write(ArticleVO vo) {
		System.out.println("ArticleService의 write()메서드 호출!");
		dao.insert(vo);
	}
	
}
