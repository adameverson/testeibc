class Board < ApplicationRecord
end

def have_phase ()
    $phase_begin = nil
    ActiveRecord::Base.connection.exec_query("select * from phases where id_board=#{@board.id} order by id").each do |phase|
      $phase_begin = phase["id"]
      return true
    end 
    return false
end

def id_phases_prev(posicao)
    id_phases_prev = []
    m = 0
    phase_id_prev = 0
    tasks = []
    pha = 0 
    ActiveRecord::Base.connection.exec_query("select * from phases where id_board=#{@board.id} order by id").each do |phase|
      ActiveRecord::Base.connection.exec_query("select * from tasks where id_phase=#{phase["id"]} order by id").each do |task|
        if pha != task["id_phase"]
          id_phases_prev.push(phase["id"])
          m = m + 1
          if phase_id_prev != 0
            id_phases_prev[m-1] = phase_id_prev
          end
          pha = task["id_phase"]
        else
          tasks.push(task)
        end
      end
      phase_id_prev = phase["id"]
    end
    while !tasks.empty?
      phase_id_prev = 0
      pha = 0
      ActiveRecord::Base.connection.exec_query("select * from phases where id_board=#{@board.id} order by id").each do |phase|
        j=0
        for task in tasks  
          if pha != task["id_phase"] && phase["id"] == task["id_phase"]
            id_phases_prev.push(phase["id"])
            m = m + 1
            if phase_id_prev != 0
              id_phases_prev[m-1] = phase_id_prev
            end
            pha = task["id_phase"] 
            tasks.delete_at(j)
          end
          j = j + 1
        end
        phase_id_prev = phase["id"]
      end
    end
    return id_phases_prev[posicao]
end

def id_tasks_prev(posicao)
    id_tasks_prev = []
    m = 0
    tasks = []
    pha = 0 
    ActiveRecord::Base.connection.exec_query("select * from phases where id_board=#{@board.id} order by id").each do |phase|
      ActiveRecord::Base.connection.exec_query("select * from tasks where id_phase=#{phase["id"]} order by id").each do |task|
        if pha != task["id_phase"]
          id_tasks_prev.push(task["id"])
          m = m + 1
          pha = task["id_phase"]
        else
          tasks.push(task)
        end
      end
    end
    while !tasks.empty?
      pha = 0
      ActiveRecord::Base.connection.exec_query("select * from phases where id_board=#{@board.id} order by id").each do |phase|
        j=0
        for task in tasks  
          if pha != task["id_phase"] && phase["id"] == task["id_phase"]
            id_tasks_prev.push(task["id"])
            m = m + 1
            pha = task["id_phase"] 
            tasks.delete_at(j)
          end
          j = j + 1
        end
      end
    end
    return id_tasks_prev[posicao]
end

def id_phases_next(posicao)
    id_phases_next = []
    k = 0
    l = 0
    tasks = []
    pha = 0 
    ActiveRecord::Base.connection.exec_query("select * from phases where id_board=#{@board.id} order by id").each do |phase|
        while l != 0
        id_phases_next[k-1] = phase["id"]
        l = l - 1
        end
        ActiveRecord::Base.connection.exec_query("select * from tasks where id_phase=#{phase["id"]} order by id").each do |task|
            if pha != task["id_phase"]  
                id_phases_next.push(phase["id"])
                k = k + 1
                l = l + 1
                pha = task["id_phase"]
            else
                tasks.push(task)
            end
        end
    end
    while !tasks.empty?
        l = 0
        pha = 0
        ActiveRecord::Base.connection.exec_query("select * from phases where id_board=#{@board.id} order by id").each do |phase|
        j=0
        while l != 0
            id_phases_next[k-1] = phase["id"]
            l = l - 1
        end
        for task in tasks  
            if pha != task["id_phase"] && phase["id"] == task["id_phase"]
            id_phases_next.push(phase["id"])
            k = k + 1
            l = l + 1
            pha = task["id_phase"] 
            tasks.delete_at(j)
            end
            j = j + 1
        end
        phase_id_prev = phase["id"]
        end
    end
    return id_phases_next[posicao]
end

def id_tasks_next(posicao)
    id_tasks_next = []
    k = 0
    l = 0
    tasks = []
    pha = 0 
    ActiveRecord::Base.connection.exec_query("select * from phases where id_board=#{@board.id} order by id").each do |phase|
      ActiveRecord::Base.connection.exec_query("select * from tasks where id_phase=#{phase["id"]} order by id").each do |task|
        if pha != task["id_phase"]
          id_tasks_next.push(task["id"])
          k = k + 1
          l = l + 1
          pha = task["id_phase"]
        else
          tasks.push(task)
        end
      end
    end
    while !tasks.empty?
      l = 0
      pha = 0
      ActiveRecord::Base.connection.exec_query("select * from phases where id_board=#{@board.id} order by id").each do |phase|
        j=0
        for task in tasks  
          if pha != task["id_phase"] && phase["id"] == task["id_phase"]
            id_tasks_next.push(task["id"])
            k = k + 1
            l = l + 1
            pha = task["id_phase"] 
            tasks.delete_at(j)
          end
          j = j + 1
        end
      end
    end
    return id_tasks_next[posicao]
end