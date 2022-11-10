package sprindi;

public class OracleArticleDAO implements ArticleDAO{

	@Override
	public void insert(ArticleVO vo) {
		System.out.println("Oracle DB에서 table에 "+vo+"를 insert한다");

	}
	
}
