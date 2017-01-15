[QueryGroup="quali"] @collection [[
[QueryItem="advogados_relatores"]
PREFIX stf: <http://www.semanticweb.org/stf/ontologies/2016/4/ontoAcordaoSTF#>
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>

SELECT distinct ?nome_advogado
WHERE {
	?relator rdf:type stf:Relator.
	?relator stf:TemNome ?nome_relator.
	?acordao stf:TemRelator ?relator.
	?acorado stf:TemAdvogado ?advogado.
	?advogado stf:TemNome ?nome_advogado

	FILTER(?nome_relator = "TEORI ZAVASCKI"^^xsd:string)
}

[QueryItem="acordao_cita"]
PREFIX stf: <http://www.semanticweb.org/stf/ontologies/2016/4/ontoAcordaoSTF#>
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>

SELECT ?nome_acordao
WHERE {
	?acordao rdf:type stf:Acordao.
	?acordao stf:TemIdentificador ?nome_acordao.
	?acordao stf:Cita ?acordao_citado.
	?acordao_citado stf:TemIdentificador ?nome_acordao_citado.

	FILTER(?nome_acordao_citado = "ADC 16"^^xsd:string)
}

[QueryItem="acordao_similar"]
PREFIX stf: <http://www.semanticweb.org/stf/ontologies/2016/4/ontoAcordaoSTF#>
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>

SELECT ?nome_acordao_similar ?decisao
WHERE {
	?acordao rdf:type stf:Acordao.
	?acordao stf:TemIdentificador ?nome_acordao.
	?acordao stf:EhSimilar ?acordao_similar.
	?acordao_similar stf:TemIdentificador ?nome_acordao_similar.
	?acordao_similar stf:TemDecisao ?decisao.

	FILTER(?nome_acordao = "AGR RE 511986"^^xsd:string)
}

[QueryItem="acordao_procurador"]
PREFIX stf: <http://www.semanticweb.org/stf/ontologies/2016/4/ontoAcordaoSTF#>
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>

SELECT  distinct ?nome_procurador 
WHERE {
	?acordao rdf:type stf:Acordao.
	?acordao stf:TemProcurador ?procurador.
	?procurador stf:TemNome ?nome_procurador.
	?acordao stf:TemIdentificador ?nome_acordao.
	?acordao stf:TemAdvogado ?advogado.
	?advogado stf:TemNome ?nome_advogado.

	FILTER(?nome_advogado = "ANTONIO CLAUDIO MARIZ DE OLIVEIRA"^^xsd:string)
}

[QueryItem="acordao_legislacao"]
PREFIX stf: <http://www.semanticweb.org/stf/ontologies/2016/4/ontoAcordaoSTF#>
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>

SELECT ?nome_legislacao
WHERE {
	?acordao rdf:type stf:Acordao.
	?acordao stf:TemIdentificador ?nome_acordao.
	?acordao stf:EhSimilar ?acordao_similar.
	?acordao_similar stf:TemIdentificador ?nome_acordao_similar.
	?acordao stf:TemLegislacao ?legislacao.
	?legislacao stf:TemIdentificador ?nome_legislacao.

	FILTER(?nome_acordao = "AGR RE 511986"^^xsd:string)
}
]]
