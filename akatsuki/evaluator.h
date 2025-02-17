// -*- mode: c++ -*-
//
// Copyright 2016 ICFP Programming Contest 2016 Organizers
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

#ifndef AKATSUKI_EVALUATOR_H
#define AKATSUKI_EVALUATOR_H

#include <iostream>

#include "problem.h"
#include "solution.h"

namespace akatsuki {

int Evaluate(const ProblemSpec& problem_spec,
             const SolutionSpec& solution_spec);

}  // namespace akatsuki

#endif  // AKATSUKI_EVALUATOR_H
