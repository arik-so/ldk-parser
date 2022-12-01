export default class CaseUtil {

	static snakeCaseToCamelCase(input: string, capitalizeFirst: boolean = false): string {
		let output = input.replace(/([_][a-z])/g, group =>
			group
			.toUpperCase()
			.replace('_', '')
		);
		if (capitalizeFirst) {
			output = output.charAt(0).toUpperCase() + output.substring(1);
		}
		return output;
	}

}