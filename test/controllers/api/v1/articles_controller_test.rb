require "test_helper"

class Api::V1::ArticlesControllerTest < ActionDispatch::IntegrationTest
  setup do 
    @articles = articles(:one)
  end
  test "should get index" do
    get api_v1_articles_url
    assert_response :success
    assert_not_nil response.body 
  end
   test "should show article" do
    get api_v1_article_url(@article)
    assert_response :success
    assert_equal @article.title, JSON.parse(response.body)["title"] 
  end

  test "should create article" do
    assert_difference('Article.count', 1) do
      post api_v1_articles_url, params: { article: { title: 'New Article', content: 'Content of the new article' } }, as: :json
    end
    assert_response :created
    assert_equal 'New Article', JSON.parse(response.body)['title']  
  end
  test "should update article" do
    patch api_v1_article_url(@article), params: { article: { title: 'Updated Title', content: 'Updated content' } }, as: :json
    assert_response :success
    assert_equal 'Updated Title', JSON.parse(response.body)['title']
  end
  test should destroy article
    test "should destroy article" do
    assert_difference('Article.count', -1) do
      delete api_v1_article_url(@article)
    end
    assert_response :no_content 
  end
end


