# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


Wolf::Role.destroy_all
# Wolf::Role.create(id: 1, name: '化身幽靈', order: 0)
Wolf::Role.create(id: 2, name: '狼人')
Wolf::Role.create(id: 3, name: '狼人')
Wolf::Role.create(id: 4, name: '爪牙')
Wolf::Role.create(id: 5, name: '守夜人')
Wolf::Role.create(id: 6, name: '守夜人')
Wolf::Role.create(id: 7, name: '預言家')
Wolf::Role.create(id: 8, name: '強盜', order: 1)
Wolf::Role.create(id: 9, name: '搗蛋鬼', order: 2)
# Wolf::Role.create(id: 10, name: '酒鬼', order: 3)
Wolf::Role.create(id: 11, name: '失眠者')
Wolf::Role.create(id: 12, name: '皮匠')
Wolf::Role.create(id: 13, name: '獵人')
Wolf::Role.create(id: 14, name: '村民')
Wolf::Role.create(id: 15, name: '村民')
Wolf::Role.create(id: 16, name: '村民')
