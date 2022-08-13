import styled from 'styled-components';

import ExerciseList from './ExerciseList';

const Div = styled.div`
  width: 93vw;
  height: 20.8vh;
  border-radius: 0.625rem;
  margin-left: 3.5vw;
  font-family: 'Pretendard-Regular';
  display: flex;
`;

const ListDiv = styled.div`
  width: 100%;
`;

const Exercise = (props) => {
  const odd = props.exerciseList.map((exercise, index) => {
    if (index % 2) {
      return (
        <ExerciseList
          title={exercise.title}
          volume={exercise.volume}
          reps={exercise.reps}
          chartData={props.chartData}
          key={`${exercise.title}${index}`}
        />
      );
    } else {
      return null;
    }
  });
  const even = props.exerciseList.map((exercise, index) => {
    if (index % 2 === 0) {
      return (
        <ExerciseList
          title={exercise.title}
          volume={exercise.volume}
          reps={exercise.reps}
          chartData={props.chartData}
          key={`${exercise.title}${index}`}
        />
      );
    } else {
      return null;
    }
  });
  return (
    <Div>
      <ListDiv>{even}</ListDiv>
      <ListDiv>{odd}</ListDiv>
    </Div>
  );
};

export default Exercise;
