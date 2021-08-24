let studentScores = {
  student1: {
    id: 123456789,
    scores: {
      exams: [90, 95, 100, 80],
      exercises: [20, 15, 10, 19, 15],
    },
  },
  student2: {
    id: 123456799,
    scores: {
      exams: [50, 70, 90, 100],
      exercises: [0, 15, 20, 15, 15],
    },
  },
  student3: {
    id: 123457789,
    scores: {
      exams: [88, 87, 88, 89],
      exercises: [10, 20, 10, 19, 18],
    },
  },
  student4: {
    id: 112233445,
    scores: {
      exams: [100, 100, 100, 100],
      exercises: [10, 15, 10, 10, 15],
    },
  },
  student5: {
    id: 112233446,
    scores: {
      exams: [50, 80, 60, 90],
      exercises: [10, 0, 10, 10, 0],
    },
  },
};

let arraySum = arr => arr.reduce((acc, el) => acc + el);

function letterGrade(grd) {
  if (grd > 92) {
    return 'A';
  } else if (grd > 84) {
    return 'B';
  } else if (grd > 76) {
    return 'C';
  } else if (grd > 69) {
    return 'D';
  } else if (grd > 59) {
    return 'E';
  } else {
    return 'F'
  }
}

function computeGrade(exams, exercises) {
  grade = Math.round((arraySum(exams) / exams.length) * 0.65 + arraySum(exercises) * 0.35);
  return String(grade) + ' ' + letterGrade(grade);
}

function generateClassRecordSummary(allScores) {
  let result = { studentGrades: [], exams: [] };
  let examGrades = [];

  Object.keys(allScores).forEach(student => {
    result.studentGrades.push(computeGrade(allScores[student].scores.exams, allScores[student].scores.exercises));
  })

  Object.keys(allScores).forEach(student => {
    allScores[student].scores.exams.forEach((val, idx) => {
      if (examGrades[idx]) {
        examGrades[idx].push(val);
      } else {
        examGrades.push([val]);
      }
    });
  });

  examGrades.forEach((exam, idx) => {
    result.exams.push({});

    result.exams[idx].average = Number((arraySum(exam) / exam.length).toFixed(1));
    result.exams[idx].minimum = Math.min(...exam);
    result.exams[idx].maximum = Math.max(...exam);
  })


  return result;

}

/*
créer array examScores = []
create object with key studentGrades [] & [exams]
Student key for each do:
  calculer note et renter dans studentGrades
  remplir array examScore
Puis remplir examps de hash
*/

console.log(generateClassRecordSummary(studentScores));

/* returns:
{
  studentGrades: [ '87 (B)', '73 (D)', '84 (C)', '86 (B)', '56 (F)' ],
  exams: [
    { average: 75.6, minimum: 50, maximum: 100 },
    { average: 86.4, minimum: 70, maximum: 100 },
    { average: 87.6, minimum: 60, maximum: 100 },
    { average: 91.8, minimum: 80, maximum: 100 },
  ],
}
*/