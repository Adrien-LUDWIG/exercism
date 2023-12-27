defmodule ProteinTranslation do
  @doc """
  Given an RNA string, return a list of proteins specified by codons, in order.
  """
  @spec of_rna(String.t()) :: {:ok, list(String.t())} | {:error, String.t()}
  def of_rna(rna) do
    reduce_rna(rna, [])
  end

  defp reduce_rna("", proteins), do: {:ok, Enum.reverse(proteins)}

  defp reduce_rna(rna, proteins) do
    {codon, rna} = String.split_at(rna, 3)

    case to_protein(codon) do
      "invalid codon" -> {:error, "invalid RNA"}
      "STOP" -> reduce_rna("", proteins)
      protein -> reduce_rna(rna, [protein | proteins])
    end
  end

  @doc """
  Given a codon, return the corresponding protein

  UGU -> Cysteine
  UGC -> Cysteine
  UUA -> Leucine
  UUG -> Leucine
  AUG -> Methionine
  UUU -> Phenylalanine
  UUC -> Phenylalanine
  UCU -> Serine
  UCC -> Serine
  UCA -> Serine
  UCG -> Serine
  UGG -> Tryptophan
  UAU -> Tyrosine
  UAC -> Tyrosine
  UAA -> STOP
  UAG -> STOP
  UGA -> STOP
  """
  @spec of_codon(String.t()) :: {:ok, String.t()} | {:error, String.t()}
  def of_codon(codon) do
    case protein = to_protein(codon) do
      "invalid codon" -> {:error, protein}
      _ -> {:ok, protein}
    end
  end

  defp to_protein(codon) do
    case codon do
      "UGU" -> "Cysteine"
      "UGC" -> "Cysteine"
      "UUA" -> "Leucine"
      "UUG" -> "Leucine"
      "AUG" -> "Methionine"
      "UUU" -> "Phenylalanine"
      "UUC" -> "Phenylalanine"
      "UCU" -> "Serine"
      "UCC" -> "Serine"
      "UCA" -> "Serine"
      "UCG" -> "Serine"
      "UGG" -> "Tryptophan"
      "UAU" -> "Tyrosine"
      "UAC" -> "Tyrosine"
      "UAA" -> "STOP"
      "UAG" -> "STOP"
      "UGA" -> "STOP"
      _ -> "invalid codon"
    end
  end
end
