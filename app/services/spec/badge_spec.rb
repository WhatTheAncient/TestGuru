module Spec
  module BadgeSpec
    class FirstTry
      def is_satisfied_by?(result)
        user = result.user
        test = result.test

        user.results.where(test: test).length == 1
      end
    end
  
    class AllCategory
      def is_satisfied_by?(result)
        user = result.user
        test = result.test

        user.tests.where(category: test.category).uniq.length == Test.where(category: test.category).length
      end
    end

    class AllLevel
      def is_satisfied_by?(result)
        user = result.user
        test = result.test

        user.tests.where(level: test.level).uniq.length == Test.where(level: test.level).length
      end
    end

    class AllTests
      def is_satisfied_by?(result)
        user = result.user
        test = result.test

        user.tests.uniq.length == Test.all.length
      end
    end
  end
end
