function createStudent(name, year) {
  return {
    name,
    year,
    courses: [],

    info() {
      console.log(this.name + ' is a ' + year + ' year student');
    },

    addCourse(course)  {
      this.courses.push(course);
    },

    listCourses() {
      return this.courses;
    },


    addNote(code, note) {
      this.courses.forEach(course => {
        if (course.code === code) {
          course.notes ? course.notes.push(note) : course.notes = [note];
        }
      })
    },

    updateNote(code, newNotes) {
      this.courses.forEach(course => {
        if (course.code === code) course.notes = [newNotes];
      })
    },

    viewNotes() {
      this.courses.forEach(course => {
        if (course.notes) {
          console.log(course.name + '; ' + course.notes.join('; '));
        }
      })
    },
  }
}

const YEARS = ['1st', '2nd', '3rd', '4th', '5th'];

const school = {
  students: [],
  addStudent(name, year) {
    if (YEARS.includes(year)) {
      const student = createStudent(name, year);
      this.students.push(student);
      return student;
    } else {
      console.log('Invalid Year');
    }
  },

  enrollStudent(student, courseName, courseCode) {
    student.addCourse({name: courseName, code: courseCode})
  },

  addGrade(student, courseName, grade) {
    const course = student.listCourses().filter(({name}) => name === courseName)[0];

    if (course) {
      course.grade = grade;
    }
  },

  getReportCard(student) {
    student.listCourses().forEach(({grade, name}) => {
      if (grade) {
        console.log(`${name}: ${String(grade)}`);
      } else {
        console.log(`${name}: In progress`);
      }
    });
  },

  courseReport(courseName) {
    function getCourse(student, courseName) {
      return student.listCourses().filter(({name}) => name === courseName)[0];
    }

    const courseStudents = this.students.map(student => {
      const course = getCourse(student, courseName) || { grade: undefined };
      return { name: student.name, grade: course.grade };
    }).filter(({grade}) => grade);

    if (courseStudents.length > 0) {
      console.log(`=${courseName} Grades=`);

      const average = courseStudents.reduce((total, {name, grade}) => {
        console.log(`${name}: ${String(grade)}`);
        return total + grade;
      }, 0) / courseStudents.length;

      console.log('---');
      console.log(`Course Average: ${String(average)}`);
    }
  },
};



let foo = {
  name: 'foo',
  year: '3rd',
  courses: [
    { name: 'Math', code: 101, grade: 95, },
    { name: 'Advanced Math', code: 102, grade: 90, },
    { name: 'Physics', code: 202, }
  ],
};

let bar = {
  name: 'bar',
  year: '1st',
  courses: [
    { name: 'Math', code: 101, grade: 91, },
  ],
};

let qux = {
  name: 'qux',
  year: '2nd',
  courses: [
    { name: 'Math', code: 101, grade: 93, },
    { name: 'Advanced Math', code: 102, grade: 90, },
   ],
};

school.addStudent(foo);
school.addStudent(bar);
school.addStudent(qux);

/*
In progress:
VALID_YEARS = ['1st', '2nd', '3rd', '4th', '5th']

function createStudent(name, year) {
  return {
    name,
    year,
    courses: [],

    info() {
      console.log(`${this.name} is a ${this.year} year student`);
    },

    listCourses() {
      return this.courses;
    },

    hasCourse(courseName) {
      for (i = 0; i < course.length; i += 1) {
        if (courses[i].name === courseName) return false;
      }
      return true;
    },

    addCourse(course) {
      if (!(this.hasCourse(course.name))) {
      this.courses.push(course);
      }
    },

    addNote(num, note) {
      this.courses.forEach(course => {
        if (course.code === num) {
          course.notes ? course.notes.push(note) : course.notes = [note];
        }
      })
    },

    updateNote(num, note) {
      this.courses.forEach(course => {
        if (course.code === num) {
          course.notes = [note];
        }
      })
    },

    viewNotes() {
      this.courses.forEach(course => {
        if (course.notes) console.log(course.name + ': ' + course.notes.join('; '));
      })
    },

    addGrade(code, grade) {
      this.courses.filter(course => course.code === code).forEach(course => {
        course.grade = grade;
      })
    },
  }
}

let school = {
  students: [],

  addStudent(student) {
    if (student.year && VALID_YEARS.includes(student.year)) {
      this.students.push(student);
      return student;
    } else {
      console.log("Invalid Year");
    }
  },

  enrollStudent(student, course) {
    this.student.addCourse(course);
  },

  addGrade(student, code, grade) {
    this.student.addGrade(code, grade);
  },

  getReportCard(student) {
    student.courses.forEach(course => {
      grade = course.grade || 'In Progress';
      console.log(course.name + ': ' + grade);
    })
  },

  courseReport(course) {
    console.log(`=${course} Grades=`);

    let avg = 0;
    let students = 0;
    this.students
        .filter(student => student.hasCourse(course.name))
        .filter(student => student.courses
                                  .filter(course => course.name === course && course.grade)
                                  .forEach(course => {
                                    
                                  })

    })
  
    console.log('---');
    console.log('Course Average: ' + avg/students);
  },
}


let foo = createStudent('foo', '3rd');
foo.addCourse({ name: 'Math', code: 101 });
foo.addCourse({ name: 'Advanced Math', code: 102 });
foo.addCourse({ name: 'Physics', code: 202 });

let bar = createStudent('bar', '1st');
foo.addCourse({ name: 'Math', code: 101 });

let qux = createStudent('foo', '2nd');
foo.addCourse({ name: 'Math', code: 101 });
foo.addCourse({ name: 'Advanced Math', code: 102 });



school.getReportCard(foo);

school.courseReport('Math');

school.courseReport('Advanced Math');

school.courseReport('Physics');
*/