package pp.pp.portfolio.team.map;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import pp.pp.portfolio.team.board.BoardVO;

@Mapper
public interface MapMapper {
   public int insert(MapVO vo);
   public List<MapVO> list(MapVO vo);
   public int updateBoardNo(BoardVO vo);
   public boolean delete(int board_no);
   public String place(BoardVO vo);
}
