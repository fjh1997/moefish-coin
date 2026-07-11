package blockchain

import (
	"testing"

	"github.com/deroproject/derohe/cryptography/crypto"
	"github.com/deroproject/graviton"
)

func TestAddressHashMatchesSerializedMiniBlockHash(t *testing.T) {
	key := []byte("catfish-miner-address-key")
	fullHash := graviton.Sum(key)

	var serializedHash crypto.Hash
	copy(serializedHash[:16], fullHash[:16])

	if !addressHashMatchesKey(key, fullHash) {
		t.Fatal("full address hash should match")
	}
	if !addressHashMatchesKey(key, serializedHash) {
		t.Fatal("miniblock serialized hash prefix should match")
	}
}

func TestAddressValidationLookupTopoUsesCandidateBlockWindow(t *testing.T) {
	tests := []struct {
		name          string
		chainTopo     int64
		candidateTopo int64
		want          int64
	}{
		{name: "candidate 29 sees registration at topo 4", chainTopo: 28, candidateTopo: 29, want: 4},
		{name: "candidate 30 sees registration at topo 5", chainTopo: 29, candidateTopo: 30, want: 5},
		{name: "early chain clamps to current state", chainTopo: 3, candidateTopo: 4, want: 3},
		{name: "candidate topo below maturity clamps to current state", chainTopo: 20, candidateTopo: 21, want: 20},
		{name: "negative candidate clamps to zero", chainTopo: 0, candidateTopo: -1, want: 0},
	}

	for _, tt := range tests {
		t.Run(tt.name, func(t *testing.T) {
			if got := addressValidationLookupTopo(tt.chainTopo, tt.candidateTopo); got != tt.want {
				t.Fatalf("lookup topo mismatch: got %d want %d", got, tt.want)
			}
		})
	}
}
