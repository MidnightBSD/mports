--- kiwi/solverimpl.h.orig
+++ kiwi/solverimpl.h
@@ -114,8 +114,43 @@
 		// the row represents an unsatisfiable constraint.
 		if( subject.type() == Symbol::Invalid )
 		{
-			if( !addWithArtificialVariable( *rowptr ) )
+			// Artificial optimization can change the tableau even when the
+			// constraint is unsatisfiable. Save only this uncommon path so a
+			// failed attempt cannot alter existing constraints or edit values.
+			RowMap saved_rows;
+			std::vector<std::unique_ptr<Row>> saved_storage;
+			saved_storage.reserve( m_rows.size() );
+			for( const auto& entry : m_rows )
+			{
+				saved_storage.emplace_back( new Row( *entry.second ) );
+				saved_rows[ entry.first ] = saved_storage.back().get();
+			}
+			std::unique_ptr<Row> saved_objective( new Row( *m_objective ) );
+			std::vector<Symbol> saved_infeasible( m_infeasible_rows );
+			auto restore = [&]() {
+				clearRows();
+				m_rows.swap( saved_rows );
+				for( auto& row : saved_storage )
+					row.release();
+				m_objective.swap( saved_objective );
+				m_infeasible_rows.swap( saved_infeasible );
+				m_artificial.reset();
+			};
+			bool success;
+			try
+			{
+				success = addWithArtificialVariable( *rowptr );
+			}
+			catch( ... )
+			{
+				restore();
+				throw;
+			}
+			if( !success )
+			{
+				restore();
 				throw UnsatisfiableConstraint( constraint );
+			}
 		}
 		else
 		{
