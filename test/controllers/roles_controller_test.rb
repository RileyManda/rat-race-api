require 'test_helper'

class RolesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @role = roles(:one)
  end

  test 'should get index' do
    get roles_url, as: :json
    assert_response :success
  end

  test 'should create role' do
    assert_difference('Role.count') do
      post roles_url,
           params: { role: { company_id: @role.company_id,
                             description: @role.description,
                             location: @role.location,
                             name: @role.name,
                             salary: @role.salary,
                             type: @role.type } }, as: :json
    end

    assert_response :created
  end

  test 'should show role' do
    get role_url(@role), as: :json
    assert_response :success
  end

  test 'should update role' do
    patch role_url(@role),
          params: { role: { company_id: @role.company_id,
                            description: @role.description,
                            location: @role.location,
                            name: @role.name,
                            salary: @role.salary,
                            type: @role.type } }, as: :json
    assert_response :success
  end

  test 'should destroy role' do
    assert_difference('Role.count', -1) do
      delete role_url(@role), as: :json
    end

    assert_response :no_content
  end
end
