class StudentGuardiansController < ApplicationController
  before_action :set_student_guardian, only: %i[ show edit update destroy ]

  # GET /student_guardians or /student_guardians.json
  def index
    @student_guardians = StudentGuardian.all
  end

  # GET /student_guardians/1 or /student_guardians/1.json
  def show
  end

  # GET /student_guardians/new
  def new
    @student_guardian = StudentGuardian.new
  end

  # GET /student_guardians/1/edit
  def edit
  end

  # POST /student_guardians or /student_guardians.json
  def create
    @student_guardian = StudentGuardian.new(student_guardian_params)

       @student_guardian.guardian.increment!(:number_of_students)
       @student_guardian.student.increment!(:number_of_guardians) 

    respond_to do |format|
      if @student_guardian.save
        format.html { redirect_to @student_guardian, notice: "Student guardian was successfully created." }
        format.json { render :show, status: :created, location: @student_guardian }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @student_guardian.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /student_guardians/1 or /student_guardians/1.json
  def update
    respond_to do |format|
      if @student_guardian.update(student_guardian_params)
        format.html { redirect_to @student_guardian, notice: "Student guardian was successfully updated.", status: :see_other }
        format.json { render :show, status: :ok, location: @student_guardian }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @student_guardian.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /student_guardians/1 or /student_guardians/1.json
  def destroy

    
    @student_guardian.destroy!
    @student_guardian.guardian.decrement!(:number_of_students)
    @student_guardian.student.decrement!(:number_of_guardians) 

    
    respond_to do |format|
      format.html { redirect_to student_guardians_path, notice: "Student guardian was successfully destroyed.", status: :see_other }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_student_guardian
      @student_guardian = StudentGuardian.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def student_guardian_params
      params.expect(student_guardian: [ :relationship, :student_id, :guardian_id ])
    end
end
