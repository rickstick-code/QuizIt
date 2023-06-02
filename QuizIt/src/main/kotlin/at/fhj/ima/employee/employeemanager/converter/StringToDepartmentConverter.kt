package at.fhj.ima.employee.employeemanager.converter

import at.fhj.ima.employee.employeemanager.entity.Department
import at.fhj.ima.employee.employeemanager.repository.DepartmentRepository
import org.springframework.core.convert.converter.Converter
import org.springframework.stereotype.Component

@Component
class StringToDepartmentConverter(val departmentRepository: DepartmentRepository) : Converter<String, Department?> {
    override fun convert(source: String): Department? {
        if (source.isNullOrBlank()) {
            return null
        }
        return departmentRepository.getById(Integer.parseInt(source));
    }
}
