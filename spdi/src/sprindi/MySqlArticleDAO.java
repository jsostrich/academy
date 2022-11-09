package sprindi;

public class MySqlArticleDAO implements ArticleDAO{

	@Override
	public void insert(ArticleVO vo) {
		System.out.println("Mysql DB에서 table에 "+vo+"를 insert한다");
	}
	
}
