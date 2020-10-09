# fibonacci sequence up to n element. Iterative version.

def fibs(n)
  fi = 1
  f0 = 0
  f1 = 1

  2.upto(n) do
    fi = f0 + f1
    f0 = f1
    f1 = fi
    fi
  end
  fi
end

puts "Iterative: #{fibs(10)}"

# fibonacci sequence up to n element. Recursive version.

def fibs_rec(n)
  return 0 if n.zero?
  return 1 if n == 1

  fibs_rec(n - 1) + fibs_rec(n - 2)
end
puts "Recursive: #{fibs_rec(10)}"
