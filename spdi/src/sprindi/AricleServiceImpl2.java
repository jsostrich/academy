package sprindi;

public class AricleServiceImpl2 implements ArticleService{
	private ArticleDAO articleDao;

	//DI - 생성자를 이용한 종속객체 주입
	public AricleServiceImpl2(ArticleDAO articleDao) {
		this.articleDao = articleDao;
	}

	@Override
	public void write(ArticleVO vo) {
		System.out.println("AricleServiceImpl2의 write()메서드 호출!");
		articleDao.insert(vo);
	}
	
	
}
